; DESCRIPTION: Places a orange 82x116 rectangle at position (305, 83).
; PLAN: r0=305(x), r1=83(y), r2=82(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 83
LDI r2, 82
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
