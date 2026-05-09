; DESCRIPTION: Places a white 95x109 rectangle at position (215, 26).
; PLAN: r0=215(x), r1=26(y), r2=95(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 26
LDI r2, 95
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
