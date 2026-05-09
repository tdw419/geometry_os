; DESCRIPTION: Composite: Places a cyan circle of radius 39 at center (279, 90) then Places a cyan dot at position (414, 16) then Creates a yellow rectangular region at (50, 171) spanning 48 by 18 pixels.
; PLAN: r0=279(x), r1=90(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=16(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=50(x), r11=171(y), r12=48(width), r13=18(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 90
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 16
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 50
LDI r11, 171
LDI r12, 48
LDI r13, 18
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
