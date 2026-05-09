; DESCRIPTION: Composite: Renders a magenta disk with center (284, 64) and radius 60 then Renders a yellow box of size 40x34 starting at (279, 205).
; PLAN: r0=284(x), r1=64(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x), r6=205(y), r7=40(width), r8=34(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 64
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 205
LDI r7, 40
LDI r8, 34
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
