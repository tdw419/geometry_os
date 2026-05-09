; DESCRIPTION: Places a cyan 41x105 rectangle at position (180, 27).
; PLAN: r0=180(x), r1=27(y), r2=41(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 27
LDI r2, 41
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
