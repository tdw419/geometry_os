; DESCRIPTION: Places a yellow 72x68 rectangle at position (415, 174).
; PLAN: r0=415(x), r1=174(y), r2=72(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 174
LDI r2, 72
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
