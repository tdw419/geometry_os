; DESCRIPTION: Composite: Renders a purple box of size 46x79 starting at (284, 103) then Draws a cyan circle centered at (214, 84) with radius 39.
; PLAN: r0=284(x), r1=103(y), r2=46(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=214(x), r6=84(y), r7=39(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 284
LDI r1, 103
LDI r2, 46
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 84
LDI r7, 39
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
