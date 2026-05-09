; DESCRIPTION: Composite: Renders a cyan disk with center (443, 112) and radius 64 then Renders a red box of size 101x36 starting at (337, 106).
; PLAN: r0=443(x), r1=112(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=337(x), r6=106(y), r7=101(width), r8=36(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 443
LDI r1, 112
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 337
LDI r6, 106
LDI r7, 101
LDI r8, 36
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
