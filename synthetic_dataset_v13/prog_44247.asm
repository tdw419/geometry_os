; DESCRIPTION: Composite: Renders a orange disk with center (117, 186) and radius 12 then Places a magenta dot at position (434, 117) then Renders a magenta line between points (154, 124) and (380, 169).
; PLAN: r0=117(x), r1=186(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=434(x), r6=117(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=154(x1), r11=124(y1), r12=380(x2), r13=169(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 117
LDI r1, 186
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 434
LDI r6, 117
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 154
LDI r11, 124
LDI r12, 380
LDI r13, 169
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
