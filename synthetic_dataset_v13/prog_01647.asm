; DESCRIPTION: Renders a cyan box of size 97x25 starting at (134, 146).
; PLAN: r0=134(x), r1=146(y), r2=97(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 146
LDI r2, 97
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
