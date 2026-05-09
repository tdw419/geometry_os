; DESCRIPTION: Places a white 104x34 rectangle at position (392, 168).
; PLAN: r0=392(x), r1=168(y), r2=104(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 168
LDI r2, 104
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
