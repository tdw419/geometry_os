; DESCRIPTION: Places a red 21x106 rectangle at position (488, 146).
; PLAN: r0=488(x), r1=146(y), r2=21(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 146
LDI r2, 21
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
