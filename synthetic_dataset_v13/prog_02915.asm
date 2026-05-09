; DESCRIPTION: Places a red 39x28 rectangle at position (171, 98).
; PLAN: r0=171(x), r1=98(y), r2=39(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 98
LDI r2, 39
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
