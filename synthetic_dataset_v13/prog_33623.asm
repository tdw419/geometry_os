; DESCRIPTION: Places a red 41x48 rectangle at position (289, 55).
; PLAN: r0=289(x), r1=55(y), r2=41(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 55
LDI r2, 41
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
