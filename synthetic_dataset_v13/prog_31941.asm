; DESCRIPTION: Places a red 90x50 rectangle at position (346, 46).
; PLAN: r0=346(x), r1=46(y), r2=90(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 46
LDI r2, 90
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
