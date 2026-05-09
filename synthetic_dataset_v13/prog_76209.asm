; DESCRIPTION: Renders a cyan box of size 106x103 starting at (41, 117).
; PLAN: r0=41(x), r1=117(y), r2=106(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 117
LDI r2, 106
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
