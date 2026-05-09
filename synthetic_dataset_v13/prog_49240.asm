; DESCRIPTION: Renders a cyan box of size 120x72 starting at (54, 85).
; PLAN: r0=54(x), r1=85(y), r2=120(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 85
LDI r2, 120
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
