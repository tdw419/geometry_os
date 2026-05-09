; DESCRIPTION: Renders a cyan box of size 75x63 starting at (418, 192).
; PLAN: r0=418(x), r1=192(y), r2=75(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 192
LDI r2, 75
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
