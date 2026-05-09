; DESCRIPTION: Places a white 79x72 rectangle at position (404, 68).
; PLAN: r0=404(x), r1=68(y), r2=79(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 68
LDI r2, 79
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
