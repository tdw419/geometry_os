; DESCRIPTION: Renders a cyan box of size 68x82 starting at (231, 5).
; PLAN: r0=231(x), r1=5(y), r2=68(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 5
LDI r2, 68
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
