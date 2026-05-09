; DESCRIPTION: Renders a cyan box of size 41x103 starting at (346, 89).
; PLAN: r0=346(x), r1=89(y), r2=41(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 89
LDI r2, 41
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
