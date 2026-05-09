; DESCRIPTION: Places a white 108x46 rectangle at position (228, 178).
; PLAN: r0=228(x), r1=178(y), r2=108(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 178
LDI r2, 108
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
