; DESCRIPTION: Places a cyan 72x53 rectangle at position (276, 152).
; PLAN: r0=276(x), r1=152(y), r2=72(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 152
LDI r2, 72
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
