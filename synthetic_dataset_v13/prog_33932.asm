; DESCRIPTION: Places a white 50x90 rectangle at position (415, 133).
; PLAN: r0=415(x), r1=133(y), r2=50(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 133
LDI r2, 50
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
