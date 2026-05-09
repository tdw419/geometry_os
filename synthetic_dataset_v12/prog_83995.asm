; DESCRIPTION: Places a red 29x48 rectangle at position (458, 161).
; PLAN: r0=458(x), r1=161(y), r2=29(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 161
LDI r2, 29
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
