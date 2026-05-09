; DESCRIPTION: Renders a cyan box of size 47x42 starting at (311, 102).
; PLAN: r0=311(x), r1=102(y), r2=47(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 102
LDI r2, 47
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
