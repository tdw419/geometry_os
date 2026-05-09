; DESCRIPTION: Composite: Creates a magenta circular shape at (46, 148) with radius 18 then Renders a purple box of size 97x48 starting at (349, 146).
; PLAN: r0=46(x), r1=148(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=146(y), r7=97(width), r8=48(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 46
LDI r1, 148
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 146
LDI r7, 97
LDI r8, 48
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
