; DESCRIPTION: Renders a cyan box of size 81x120 starting at (16, 24).
; PLAN: r0=16(x), r1=24(y), r2=81(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 24
LDI r2, 81
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
