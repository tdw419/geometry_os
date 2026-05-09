; DESCRIPTION: Composite: Renders a white box of size 65x77 starting at (401, 156) then Places a yellow circle of radius 47 at center (394, 134).
; PLAN: r0=401(x), r1=156(y), r2=65(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x), r6=134(y), r7=47(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 401
LDI r1, 156
LDI r2, 65
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 134
LDI r7, 47
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
