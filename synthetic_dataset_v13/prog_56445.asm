; DESCRIPTION: Renders a cyan box of size 120x34 starting at (106, 135).
; PLAN: r0=106(x), r1=135(y), r2=120(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 135
LDI r2, 120
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
