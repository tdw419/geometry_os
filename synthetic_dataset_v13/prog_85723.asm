; DESCRIPTION: Places a cyan 30x46 rectangle at position (271, 14).
; PLAN: r0=271(x), r1=14(y), r2=30(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 14
LDI r2, 30
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
