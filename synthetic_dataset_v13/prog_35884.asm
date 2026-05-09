; DESCRIPTION: Places a cyan 71x41 rectangle at position (269, 169).
; PLAN: r0=269(x), r1=169(y), r2=71(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 169
LDI r2, 71
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
