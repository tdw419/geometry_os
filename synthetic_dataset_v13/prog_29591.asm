; DESCRIPTION: Renders a cyan box of size 68x107 starting at (428, 39).
; PLAN: r0=428(x), r1=39(y), r2=68(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 39
LDI r2, 68
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
