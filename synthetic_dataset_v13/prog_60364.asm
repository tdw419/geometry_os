; DESCRIPTION: Renders a cyan box of size 22x120 starting at (184, 30).
; PLAN: r0=184(x), r1=30(y), r2=22(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 30
LDI r2, 22
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
