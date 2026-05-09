; DESCRIPTION: Places a white 76x46 rectangle at position (269, 187).
; PLAN: r0=269(x), r1=187(y), r2=76(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 187
LDI r2, 76
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
