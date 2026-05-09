; DESCRIPTION: Renders a purple box of size 41x68 starting at (410, 187).
; PLAN: r0=410(x), r1=187(y), r2=41(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 187
LDI r2, 41
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
