; DESCRIPTION: Places a yellow 47x77 rectangle at position (237, 173).
; PLAN: r0=237(x), r1=173(y), r2=47(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 173
LDI r2, 47
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
