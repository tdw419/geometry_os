; DESCRIPTION: Renders a cyan box of size 23x25 starting at (101, 186).
; PLAN: r0=101(x), r1=186(y), r2=23(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 186
LDI r2, 23
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
