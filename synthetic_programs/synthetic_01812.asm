; counted animation
; initialization
  LDI r8, 2
  LDI r9, 401
  LDI r15, 47
loop_0:
  CMPI r9, r8, 0xA5ADB0
  LDI r7, 1
  SUB r15, r15, r7
  JNZ r15, loop_0
  HALT
