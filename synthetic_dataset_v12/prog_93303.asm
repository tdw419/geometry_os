; DESCRIPTION: Composite: Creates a cyan circular shape at (228, 150) with radius 66 then Places a purple dot at position (67, 67) then Renders a blue line between points (346, 214) and (419, 32).
; PLAN: r0=228(x), r1=150(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=67(x), r6=67(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=346(x1), r11=214(y1), r12=419(x2), r13=32(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 228
LDI r1, 150
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 67
LDI r6, 67
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 346
LDI r11, 214
LDI r12, 419
LDI r13, 32
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
