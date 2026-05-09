; DESCRIPTION: Renders a cyan box of size 12x113 starting at (288, 41).
; PLAN: r0=288(x), r1=41(y), r2=12(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 41
LDI r2, 12
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
