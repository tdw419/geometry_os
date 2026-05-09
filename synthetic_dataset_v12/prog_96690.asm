; DESCRIPTION: Places a white 71x40 rectangle at position (202, 94).
; PLAN: r0=202(x), r1=94(y), r2=71(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 94
LDI r2, 71
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
