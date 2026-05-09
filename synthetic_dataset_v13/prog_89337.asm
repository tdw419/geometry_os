; DESCRIPTION: Renders a cyan box of size 12x47 starting at (154, 94).
; PLAN: r0=154(x), r1=94(y), r2=12(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 94
LDI r2, 12
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
