; DESCRIPTION: Places a cyan 101x59 rectangle at position (159, 171).
; PLAN: r0=159(x), r1=171(y), r2=101(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 171
LDI r2, 101
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
