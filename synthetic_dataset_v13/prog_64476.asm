; DESCRIPTION: Renders a cyan box of size 61x95 starting at (6, 50).
; PLAN: r0=6(x), r1=50(y), r2=61(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 50
LDI r2, 61
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
