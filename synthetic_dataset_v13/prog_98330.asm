; DESCRIPTION: Composite: Sets a single cyan pixel at (48, 70) then Renders a red disk with center (429, 191) and radius 45 then Renders a red box of size 13x37 starting at (489, 218).
; PLAN: r0=48(x), r1=70(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=429(x), r6=191(y), r7=45(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=489(x), r11=218(y), r12=13(width), r13=37(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 48
LDI r1, 70
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 429
LDI r6, 191
LDI r7, 45
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 489
LDI r11, 218
LDI r12, 13
LDI r13, 37
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
