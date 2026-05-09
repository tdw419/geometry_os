; DESCRIPTION: Composite: Renders a green box of size 36x33 starting at (424, 215) then Places a cyan circle of radius 26 at center (209, 173).
; PLAN: r0=424(x), r1=215(y), r2=36(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=173(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 424
LDI r1, 215
LDI r2, 36
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 173
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
