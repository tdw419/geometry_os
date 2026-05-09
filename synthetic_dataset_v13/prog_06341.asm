; DESCRIPTION: Composite: Creates a purple circular shape at (410, 73) with radius 50 then Renders a cyan box of size 63x92 starting at (431, 86).
; PLAN: r0=410(x), r1=73(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x), r6=86(y), r7=63(width), r8=92(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 410
LDI r1, 73
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 86
LDI r7, 63
LDI r8, 92
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
