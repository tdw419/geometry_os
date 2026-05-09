; DESCRIPTION: Composite: Places a purple 28x19 rectangle at position (83, 198) then Renders a magenta line between points (372, 173) and (82, 242).
; PLAN: r0=83(x), r1=198(y), r2=28(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x1), r6=173(y1), r7=82(x2), r8=242(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 198
LDI r2, 28
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 173
LDI r7, 82
LDI r8, 242
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
