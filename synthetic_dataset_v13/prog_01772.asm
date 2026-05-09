; DESCRIPTION: Composite: Renders a magenta line between points (283, 222) and (118, 10) then Places a green 27x12 rectangle at position (72, 202).
; PLAN: r0=283(x1), r1=222(y1), r2=118(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=202(y), r7=27(width), r8=12(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 283
LDI r1, 222
LDI r2, 118
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 202
LDI r7, 27
LDI r8, 12
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
