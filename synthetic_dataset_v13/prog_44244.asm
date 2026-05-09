; DESCRIPTION: Composite: Places a blue dot at position (487, 239) then Renders a cyan box of size 111x80 starting at (358, 104) then Renders a cyan line between points (365, 194) and (214, 12).
; PLAN: r0=487(x), r1=239(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=358(x), r6=104(y), r7=111(width), r8=80(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=365(x1), r11=194(y1), r12=214(x2), r13=12(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 487
LDI r1, 239
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 358
LDI r6, 104
LDI r7, 111
LDI r8, 80
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 194
LDI r12, 214
LDI r13, 12
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
