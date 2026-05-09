; DESCRIPTION: Renders a cyan box of size 79x83 starting at (206, 93).
; PLAN: r0=206(x), r1=93(y), r2=79(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 93
LDI r2, 79
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
