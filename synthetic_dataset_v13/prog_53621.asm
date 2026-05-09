; DESCRIPTION: Composite: Creates a magenta circular shape at (374, 79) with radius 54 then Draws a cyan rectangle at (450, 112) with width 52 and height 120.
; PLAN: r0=374(x), r1=79(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=450(x), r6=112(y), r7=52(width), r8=120(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 79
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 450
LDI r6, 112
LDI r7, 52
LDI r8, 120
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
