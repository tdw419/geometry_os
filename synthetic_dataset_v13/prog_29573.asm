; DESCRIPTION: Places a cyan 39x85 rectangle at position (400, 77).
; PLAN: r0=400(x), r1=77(y), r2=39(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 77
LDI r2, 39
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
