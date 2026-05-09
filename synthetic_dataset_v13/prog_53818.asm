; DESCRIPTION: Renders a cyan box of size 107x34 starting at (191, 120).
; PLAN: r0=191(x), r1=120(y), r2=107(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 120
LDI r2, 107
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
