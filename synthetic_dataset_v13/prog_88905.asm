; DESCRIPTION: Renders a cyan box of size 103x96 starting at (54, 120).
; PLAN: r0=54(x), r1=120(y), r2=103(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 120
LDI r2, 103
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
