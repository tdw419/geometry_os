; DESCRIPTION: Composite: Places a blue circle of radius 24 at center (71, 222) then Places a cyan dot at position (132, 254) then Places a cyan 113x34 rectangle at position (199, 180).
; PLAN: r0=71(x), r1=222(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=254(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=199(x), r11=180(y), r12=113(width), r13=34(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 71
LDI r1, 222
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 254
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 199
LDI r11, 180
LDI r12, 113
LDI r13, 34
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
