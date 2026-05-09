; DESCRIPTION: Renders a cyan box of size 29x103 starting at (323, 120).
; PLAN: r0=323(x), r1=120(y), r2=29(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 120
LDI r2, 29
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
